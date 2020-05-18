<% js = escape_javascript(
  render(partial: 'job_postings/list', locals: { job_posting: @job_posting })
) %>
$("#filtered-results").html("<%= js %>");
