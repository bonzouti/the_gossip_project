require 'csv'
class Gossip
  @@all_gossips = []
  attr_accessor :author, :content, :id
 
  def initialize(author, content)
    @author  = author
    @content = content

    
  end

  def save
    #création d'un fichier csv dans la db
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end  
  end

  def self.all
    #@@all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      @@all_gossips << Gossip.new(csv_line[0], csv_line[1]) 
  end
  return @@all_gossips
end

 def self.find(id)
    return Gossip.all[id-1.to_i]
  end
end


