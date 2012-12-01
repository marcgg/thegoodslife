class Steps::Deal < Step
  def created_at=(*)
    self.affected_date = super
  end

  def affected_date
    created_at
  end

  def open?
    !winner_id?
  end

  def main_actor
    if open?
      owner
    else
      winner
    end
  end
end
