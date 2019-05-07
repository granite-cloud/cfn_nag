require 'spec_helper'

describe 'cfn_nag template file input', end_to_end: true do
  context 'when reading in a template file with 1 failure' do
    it "should print out 'failure_count': 1 " do
      test_template = Dir.pwd + '/spec/aws_sample_templates/ElastiCache.template'

      expect { system %( cfn_nag #{test_template} ) }
        .to output(a_string_including('"failure_count": 1'))
        .to_stdout_from_any_process
    end
  end
end
