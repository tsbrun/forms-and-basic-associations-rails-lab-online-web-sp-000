class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist 
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    # only persists relationship on child side 
  end

  def artist_name
    self.artist ? self.artist.name : nil
    # if no artist set for song, returns nil instead of throwing an error
  end

  def song_notes=(notes)
    notes.each do |content|
      note = Note.create(content: content)
      self.notes << note 
    end
  end
end
