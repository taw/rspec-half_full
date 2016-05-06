describe "Rspec half full" do
  let(:example_project_path) { "#{__dir__}/example_project" }
  it "is half full" do
    results = Dir.chdir(example_project_path) do
      `rspec`
    end
    expect(results).to_not include("fail")
    expect(results).to include("100 examples, 80 already successful, 10 future successes, 10 pending")
  end
end
