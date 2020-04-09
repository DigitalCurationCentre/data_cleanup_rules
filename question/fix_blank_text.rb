# frozen_string_literal: true
module DataCleanup
  module Rules
    # Fix blank text on Question
    module Question
      class FixBlankText < Rules::Base

        def description
          "Fix blank text on Question"
        end

        def call
          ids = ::Question.where(text: ["", nil]).ids
          log("Updating Questions with blank Text: #{ids}")
          ::Question.where(id: ids).update_all(text: "Question Text")
        end
      end
    end
  end
end
