require 'spec_helper'

describe 'UniversalEntry' do
  with_test_dir

  before do
    @path = test_dir['a/b/c']
  end

  describe 'existence' do
    it "should check both files and dirs" do
      @path.should_not exist
      @path.dir.create
      @path.should be_dir
      @path.should exist

      @path.file.create
      @path.should be_file
      @path.should exist
    end
  end

  describe 'deleting' do
    it "should delete both files and dirs" do
      @path.dir.create
      @path.should be_dir
      @path.entry.delete
      @path.should_not exist

      @path.file.create
      @path.should be_file
      @path.entry.delete
      @path.should_not exist
    end

    it "shouldn't raise if file not exist" do
      @path.delete
    end
  end

  describe 'copy_to' do
    before do
      @from = @path.dir
      @from.create
      @from.file('file').write 'something'
      @from.dir('dir').create.tap do |dir|
        dir.file('file2').write 'something2'
      end

      @to = test_dir['to']
    end

    it "shoud copy dir" do
      @from.entry.copy_to @to
      @to['dir/file2'].file?.should be_true
    end

    it "should copy file" do
      @from['file'].entry.copy_to @to
      @to.file.should be_true
    end

    it "should raise if entry not exist" do
      -> {@from['non existing'].entry.copy_to @to}.should raise_error(/not exist/)
    end
  end

  describe 'move_to'
end