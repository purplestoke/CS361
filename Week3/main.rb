


class Student
  MAX_COURSES_ALLOWED = 5

  def remove_from_schedule(course, schedule, quarter_id)
    quarter = schedule.get_quarter(quarter_id)
    return unless quarter

    course_list = quarter.course_list
    course_list.remove(course)
  end

  def add_to_schedule(course, schedule, quarter_id)
    quarter = schedule.get_quarter(quarter_id)
    return unless quarter

    course_list = quarter.course_list
    return if course_list.maximum_number_of_courses >= MAX_COURSES_ALLOWED

    course_list.add(course)
  end
end
