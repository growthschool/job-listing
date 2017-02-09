# README

This is My first week assignment




random notes

http://localhost:3000/jobs/2/resume/3

here 3 is :id, 2 is :job_id

@jobs = Job.find(params[:job_id])


	<%= form_for @job do |f| %>
		<%= f.input :title %>
		<%= f.input :description %>
	<% end %>

	The above is short-hand for the following:

	New:
	<%= form_for @job, :url => jobs_path, :method => :post %>

	Edit:
	<%= form_for @job, :url => jobs_path(@job), :method => :put %>

	Admin - Namespace (admin)
	<%= form_for [:admin, @job] do |f| %>
	<%= form_for @job, :url => admin_jobs_path, :method => :put %>

	Dual Layer
	<%= form_for [@job, @resume] do |f| %>
	<%= form_for @job, :url => job_resumes_path, :method => :put %>


	<%= form_for :job do |f| %>
		job = Job.new - computer guesses what "job" is, better to define @job = Job.new in controller
