module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      fa_icon "fa-lock"
    else
      fa_icon "fa-gobel"
    end
  end
end
