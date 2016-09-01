class SearchHistoryController < ApplicationController
  helper BlacklightRangeLimit::ViewHelperOverride
  helper RangeLimitHelper
end
