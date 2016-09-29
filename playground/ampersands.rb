# Let's start with a link: https://andrewjgrimm.wordpress.com/2011/10/03/in-ruby-method-passes-you/

# The following gets the :put_id string, turns it to a proc and passes it to the
# map method in place of the block it expects. The map calls the resulting proc
# on each method of the array.
Model.all.map(&:put_id) # put_id is an object method

def hi
  puts 'hi'
end

m = method(:hi) # returns an object that holds the method! Whaddya know!?
m.call

m.to_proc # this is what happens in that map up there. this is how we can now pass this method around

# filenames = ["a.txt", "b.txt", "c.txt"]
# texts = filenames.map(&File.method(:read))

File.method(:read) # this works
Model.method(:pub) # this works as well, for a statis public Model.pub

Model.all.map(&Model.method(:pub)) # pub is a class method (a singleton? what's a singleton method?)
# OUTPUT: public: [#<Model id: 1, created_at: "2016-08-11 17:39:54", updated_at: "2016-08-11 17:39:54", field: nil>]
