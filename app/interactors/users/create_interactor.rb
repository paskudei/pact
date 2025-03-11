# frozen_string_literal: true

module Users
  class CreateInteractor
    include Contractable
    include Formable

    attr_reader :params

    def initialize(params:)
      @params = params
    end

    def call
      contract_params
      validate_form

      ActiveRecord::Base.transaction do
        create_user
        create_interests
        create_skills
      end

      @user
    end

    private

    def validate_form
      CreateForm.new(contract_params[:user]).call
    end

    def create_user
      @user = User.create!(user_params)
    end

    def user_params
      user_params = contract_params[:user]
      user_params.merge!(
        full_name:
      )
      user_params
    end

    def full_name
      "#{contract_params.dig(:user, :surname)} " \
      "#{contract_params.dig(:user, :name)} " \
      "#{contract_params.dig(:user, :patronymic)}".strip
    end

    def create_interests
      interests = Interest.where(name: contract_params[:interests].map! { |skill| skill[:name] })
      @user.interests << interests
    end

    def create_skills
      skills = Skill.where(name: contract_params[:skills].map! { |skill| skill[:name] })
      @user.skills << skills
    end
  end
end
