# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
  assert Movie.all.size > 0, "No movies created" # if condition returns false then message "no movies created" is returned otherwise test passes ok!
  # assert false, "Unimplmemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  # save_and_open_page
  e1_index = page.body.index e1
  e2_index = page.body.index e2
  assert !e1_index.nil? && !e2_index.nil? && e1_index < e2_index, "#{e1} does not appear before #{e2}"
  #p page.body
  # assert false, "Unimplmemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

# it was When I changed it
Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split( /,\s?/ ).each do |rating|
    if uncheck
      step %Q(I uncheck "ratings_#{rating}")
    else
      step %Q(I check "ratings_#{rating}")
    end
  end
end

Then /I should see all of the movies/ do
  assert Movie.all.size == page.all("#movies tr").size - 1, "Not listing all the movies"
end

# Luga note: you do not need to implement Given, the methods defined for "When" also match for "Given" :-) sooo cool!!
#Given /I check the following ratings: (.*)/ do |rating_list|
#  step %Q(When I check the following ratings: #{rating_list})
#end

# Luga note: you do not need to implement And, the methods defined for "When" also match for "And" :-) sooo cool!!
#And /I click the button "(.*)"/ do |button_id|
#  step %Q(I press "#{button_id}")
#end

# Luga note: you do not need to implement And, the methods defined for "Then" also match for "And" :-) sooo cool!!
#Then /"(.*)" is (in)?visible/ do |e1, invisible|
  #save_and_open_page
#  if invisible
#    assert page.body.index(e1).nil?, "#{e1} should be invisible"
#  else
#    assert !page.body.index(e1).nil?, "#{e1} should be visible"
#  end
#end
