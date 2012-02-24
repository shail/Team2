require './users'

describe Users do
  it 'exists' do
    Users
  end
  
  it "should read the config file" do
    config_file = YAML::load(File.open('config.yml'))
    config_file['username'].should_not be ''
  end
end