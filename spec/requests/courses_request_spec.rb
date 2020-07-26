# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Courses", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /courses/:id" do
    let(:course) { create(:course) }

    it "returns http success" do
      get "/courses/#{course.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /courses/:id/groups/:group_id/join" do
    let(:group) { create(:group) }
    let(:second_group) { create(:group) }

    it "returns http success" do
      get "/courses/#{group.course.id}/groups/#{group.id}/join"

      expect(response).to have_http_status(:success)
    end

    it "raises ActiveRecord::RecordNotFound when group does not belong to a course" do
      expect { get "/courses/#{group.course.id}/groups/#{second_group.id}/join" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
