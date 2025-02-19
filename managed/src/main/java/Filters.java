// Copyright (c) YugaByte, Inc.

import com.google.inject.Inject;
import play.filters.cors.CORSFilter;
import play.filters.csrf.CSRFFilter;
import play.http.DefaultHttpFilters;

public class Filters extends DefaultHttpFilters {

  @Inject
  public Filters(
      CSRFFilter csrfFilter,
      CORSFilter corsFilter,
      RequestLoggingFilter requestLoggingFilter,
      RequestHeaderFilter requestHeaderFilter) {
    super(csrfFilter, corsFilter, requestLoggingFilter, requestHeaderFilter);
  }
}
