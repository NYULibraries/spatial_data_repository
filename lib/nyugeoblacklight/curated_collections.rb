module NyuGeoblacklight
  class CuratedCollections

    def CuratedCollections.collections
      [
          {title: "New York City Open Data", description: "A collection of datasets related to NYC infrastructure, real estate, transportation, and political geography", href: "./?f[dc_rights_s][]=Public&f[dct_spatial_sm][]=New York, New York, United States"},
          {title: "NYU Research Data", description: "Geospatial data submitted for preservation by NYU students, faculty, and staff", href: ""},
          {title: "U.S. Census Data", description: "Datasets which package data from the U.S. Census, or American Community Survey, along with geographic boundaries", href: ""},
          {title: "Soviet Topographic Maps of the Arabian Peninsula", description: "Raster scans of Soviet military topographic maps produced in the late 1970s", href: ""}
      ]
    end

    def CuratedCollections.recent
      [
          {title: "Mexico Encuesta Intercensal 2015", description: "Layers from the 2015 Mexican Intercensal Survey", href: "./?f[dct_isPartOf_sm][]=Encuesta Intercensal 2015"},
          {title: "Soviet Topographic Maps of the Arabian Peninsula", description: "Raster scans of Soviet military topographic maps produced in the late 1970s", href: ""}
      ]
    end

    def CuratedCollections.maps
      [
          {title: "China: Ch'ang-sha Region", slug: "harvard-ams7810-s250-u54-nh49-16"},
          {title: "1967 Communist China Agriculture", slug: "nyu_2451_36739"},
          {title: "2015 New York City Real Estate Sales", slug: "nyu_2451_34678"},
          {title: "1978 Soviet Map of Abu Dhabi", slug: "nyu_2451_34737"},
          {title: "2015 MapPLUTO Brooklyn V. 1", slug: "nyu_2451_34521"},
          {title: "100-Meter Resolution Land Cover of the Conterminous United States", slug: "stanford-wv372bn9329"},
          {title: "2016 LION Single Line Map for New York City", slug: "nyu_2451_34565"}
      ]
    end

  end
end

