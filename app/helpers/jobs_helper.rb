module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
      #<i class="fa fa-lock" aria-hidden="true"></i>
      #{}"(Hidden)"
    else
      content_tag(:span, "", :class => "fa fa-globe")
      #{}"(Public)"
    end
  end
end
