# PRESTON EVERSAUL
# SIMPLE MATH OPERATIONS IN RUBY

puts "Let's do some Math!"
puts "Type 'quit' to exit"

while true
    print "SuperMathyBot>"
    # TAKE USER INPUT AND CHECK IF USER WANTS TO EXIT PROGRAM
    input = gets.strip
    break if input.downcase == 'quit'

    # TAKE ALL ARGS FROM USER INPUT, IF NOT 3 WE ASK AGAIN
    parts = input.split
    next if parts.length != 3

    # SPLITTING ARGS INTO 3 VARS
    operation, num1, num2 = parts
    # CHANGING NUMBER ARGS TO FLOATS 
    num1 = num1.to_f
    num2 = num2.to_f

    # TAKING OPERATION VAR AND MAKING IT LOWERCASE
    # THEN CHECKIN OPERATION VAR FOR MATCHING VALUES TO EXECUTE OPERATIONS
    case operation.downcase
    # ADDITION
    when "add"
        puts num1 + num2
    # SUBTRACTION
    when "sub"
        puts num1 - num2
    # MULTIPLCATION
    when "mul"
        puts num1 * num2
    # DIVISION
    when "div"
        # CHECK FOR DIVIDE BY 0 ERROR
        if num2 == 0
            puts "Cannot divide by 0"
        else
            puts num1 / num2
        end
    # IF OPERATION VAR NOT FOUND REMIND USER OF CMDS
    else
        "Cmds: add, sub, mul, div"
    end
end 
