# frozen_string_literal: true
module DataCleanup
  module Rules
    # Fix abbreviation on Languages
    module Language
      class FixInvalidAbbreviation < Rules::Base

        def description
          "Fix invalid abbreviation on Language"
        end

        def call
          Language.all.each do |lang|
            if lang.abbreviation.contain?('_')
              lang.update(abbreviation: lang.abbreviation.gsub('_', '-'))
            end
          end
        end

      end
    end
  end
end
