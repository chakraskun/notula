# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApplicationController
      def index
        members = Member.all
        render json: MemberSerializer.new(members).serializable_hash
      end

      def show
        member = Member.find_by(id: params[:id])
        render json: MemberSerializer.new(member).serializable_hash
      end

      def create
        member = Member.new(member_params)
        if member.save
          render json: MemberSerializer.new(member).serializable_hash
        else
          render json: { error: member.errors.messages }, status: 422
        end
      end

      def update
        member = Member.find_by(id: params[:id])
        if member.update(member_params)
          render json: MemberSerializer.new(member).serializable_hash
        else
          render json: { error: member.errors.messages }, status: 422
        end
      end

      def destroy
        member = Member.find_by(id: params[:id])
        if member.destroy
          head :no_content
        else
          render json: { error: member.errors.messages }, status: 422
        end
      end

      private

      def member_params
        params.require(:member).permit(:name, :desc, :team_id)
      end
    end
  end
end
