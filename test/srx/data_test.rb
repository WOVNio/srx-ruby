# frozen_string_literal: true

require 'test_helper'

module Srx
  class DataTest < Minitest::Test
    def test_load
      refute_nil(sample_data)
    end

    def test_header
      srx = sample_data

      assert(srx.segments_subflows?)
      assert(srx.cascade?)

      refute_nil(srx.send(:format_handle, :start))

      refute(srx.include_start_formatting?)
      assert(srx.include_end_formatting?)
      assert(srx.include_isolated_formatting?)
    end

    def test_languagerules
      language_rules = sample_data.language_rules
      refute(language_rules.empty?)

      default = language_rules.first
      assert_equal('Default', default.name)

      rules = default.rules
      refute(rules.empty?)
    end

    def test_rule
      rule = sample_data.language_rules.first.rules.first

      refute(rule.break?)
      assert_equal(/^\s*[0-9]+\./, rule.before_break)
      assert_equal(/\s/, rule.after_break)
    end

    def test_maprules
      map_rules = sample_data.map_rules
      refute(map_rules.empty?)
    end

    def test_languagemap
      english = sample_data.map_rules.first

      assert_equal('English', english.language_rule_name)
      assert_equal(/[Ee][Nn].*/, english.language_pattern)
    end
  end
end
