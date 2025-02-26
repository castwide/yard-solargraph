# frozen_string_literal: true

RSpec.describe YARD::Solargraph do
  before :all do
    YARD.parse_string <<-CODE
    # @generic Key An ID
    # @generic Value The value associated with the key
    class Example
      # @yieldparam [generic<Key>]
      # @yieldparam [generic<Value>]
      def to_generics; end

      # @yieldreceiver [Array] An array evaluates the block
      def to_receiver; end
    end
    CODE
  end

  it "has a version number" do
    expect(YARD::Solargraph::VERSION).not_to be nil
  end

  it 'documents @generic' do
    example = YARD::Registry.at('Example')
    expect(example.tags(:generic).length).to eq(2)
    doc = example.format(text_template_options)
    expect(doc).to include('Key - An ID')
    expect(doc).to include('Value - The value associated with the key')
  end

  it 'documents @yieldreceiver' do
    to_receiver = YARD::Registry.at('Example#to_receiver')
    expect(to_receiver.tags(:yieldreceiver).length).to eq(1)
    doc = to_receiver.format(text_template_options)
    expect(doc).to include('(Array) - An array evaluates the block')
  end
end
