require 'json'

module Scan
  def self.scan(_dir)
    # Don't worry about this mapping, it's just getting a 2d array
    f2b_array = Floor.includes(:prodiver_floor_id).map do |f|
      [f.prodiver_floor_id.floor_id.to_s, f.office_building_id] unless f.prodiver_floor_id.nil?
    end
    f2b = Hash[*f2b_array.compact.flatten] # turning a 2d array into a hash!

    stats = parse_all(args[:dir].to_s, f2b)

    stats.each do |bld, data|
      data.each do |day, count|
        puts "#{bld},#{day},#{count}" unless bld.nil?
      end
    end
  end

  # returns a hash: {floorRefId: {date: number_of_records}}
  def self.parse_one(infile_name)
    return if !File.exist?(infile_name) || File.directory?(infile_name)

    stats = {}
    File.open(infile_name).each_line do |line|
      json = JSON.parse line
      id = json['floorRefId'].to_s
      day = json['time'].to_s[0, 10]

      stats[id] = {} unless stats.key? id
      stats[id][day] = stats[id].key? day ? stats[id][day] + 1 : 1
    end
    stats
  end

  def parse_all(dir)
    return unless Dir.exist?(dir)

    stats_all = {}
    Dir.entries(dir).each do |file|
      stats = parse_one(file)
      stats.each { |floor, day| stats_all[floor] = stats_all[floor].to_h.merge day }
    end
    stats_all
  end
end
