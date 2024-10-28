# Exercise 5 Part 1 (Exception Handling)

class MentalState
  def auditable
    # true if the external service is online, otherwise false
  end
  def audit
    # Could fail if external service is offline
  end
  def do_work
    # Amazing stuff...
  end
end

class MorningMentalState < MentalState
  attr_reader :status

  def initialize(status)
    @status = status
  end

  def do_work
    puts "Working with a mental state of #{@status}"
  end
end

# NULL OBJECT FOR MorningMentalState WHEN AUDIT IS NA
class NullMorningMentalState < MentalState
  def do_work
    puts "Null state so no work"
  end
end

# WRAPPER METHOD FOR AUDIT LOGIC AND ERROR HANDLING W/ NULL OBJECT
def audit_sanity(bedtime_mental_state)

  # RETURN NULL OBJECT IF NOT AUDITABLE
  unless bedtime_mental_state.auditable
    return NullMorningMentalState.new
  end

  begin
    if bedtime_mental_state.audit.ok?
      MorningMentalState.new(:ok)
    else
      MorningMentalState.new(:not_ok)
    end

  # RETURN NULL OBJECT IN CASE OF FAILURE
  rescue StandardError => e
    puts "Audit failed: #{e.message}"
    NullMorningMentalState.new
  end
end

bedtime_mental_state = MentalState.new
new_state = audit_sanity(bedtime_mental_state)

if new_state.is_a?(NullMorningMentalState)
  puts "Audit cannot be performed"
else
  new_state.do_work
end


# Exercise 5 Part 3 (Wrapping APIs)
class CandyMachineWrapper
  def initialize
    @machine = CandyMachine.new
    @machine.prepare
  end

  def make_candy
    if @machine.ready?
      @machine.make!
    else
      handle_failure
    end
  rescue StandardError => e
    puts "Failed to make any candy: #{e.message}"
  end

  private

  # IF CANDY MACHINE IS NOT READY
  def handle_failure
    puts "Machine not ready. Please check the machine status."
  end
end

candy_machine = CandyMachineWrapper.new
candy_machine.make_candy
