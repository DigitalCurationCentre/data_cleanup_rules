module DataCleanup
  module Rules
    module Plan
      class FixBlankTitle < Rules::Base

        def description
          "Fix blank title on Plan"
        end

        def call
          ::Plan.where(title: [nil, '']).each do |plan|
            log("Updating title on Plan#{plan.id}")
            plan.update!(title: "My plan (#{plan.template.title})")
          end
        end
      end
    end
  end
end
