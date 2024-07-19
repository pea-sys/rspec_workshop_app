# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/masami'
require_relative 'rubocop/masami/version'
require_relative 'rubocop/masami/inject'

RuboCop::Masami::Inject.defaults!

require_relative 'rubocop/cop/masami_cops'
