# frozen_string_literal: true
module DataCleanup
  module Rules
    # Fix blank title on Phase
    module Phase
      class FixBlankTitle < Rules::Base

        def description
          "Fix blank title on Phase"
        end

        def call
          ids = ::Phase.where(title: ["", nil]).ids
          log("Updating Phase without Title: #{ids}")
          ::Phase.where(id: ids).update_all(title: "default title")
        end
      end
    end
  end
end
