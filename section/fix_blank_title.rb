# frozen_string_literal: true
module DataCleanup
  module Rules
    # Fix blank title on Section
    module Section
      class FixBlankTitle < Rules::Base

        def description
          "Fix blank title on Section"
        end

        def call
          ids = ::Section.where(title: ["", nil]).ids
          log("Updating Sections without Title: #{ids}")
          ::Section.where(id: ids).update_all(title: "Default Title")
        end
      end
    end
  end
end
