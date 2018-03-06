require 'spec_helper'

describe('User') do
  it("validates presence of User name") do
    user = User.new({:name => "", :password => "asdas"})
    expect(user.save()).to(eq(false))
  end

  it("validates presence of password") do
    user = User.new({:name => "a".*(16), :password => ""})
    expect(user.save()).to(eq(false))
  end

  it("validates length of user name is less than 20 characters") do
    user = User.new({:name => "a".*(16), :password => "sefafa"})
    expect(user.save()).to(eq(true))
  end

  it("tests for user name uniqueness") do
    user = User.create({:name => "Emily", :password => "sefafa"})
    user2 = User.new({:name => "Emily", :password => "faefasd"})
    expect(user2.save()).to(eq(false))
  end
end
