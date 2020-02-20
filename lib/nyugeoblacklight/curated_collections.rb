module NyuGeoblacklight
  class CuratedCollections

    def CuratedCollections.collections
      [
          {title: "New York City Open Data", description: "A collection of datasets related to NYC infrastructure, real estate, transportation, and political geography", f: { "dc_rights_s" => ["Public"], "dct_spatial_sm" => ["New York, New York, United States"]}},
          {title: "NYU Research Data", description: "Geospatial data submitted for preservation by NYU students, faculty, and staff", f: {"dct_isPartOf_sm" => ["NYU Research Data"]}},
          #{title: "U.S. Census Data", description: "Datasets which package data from the U.S. Census, or American Community Survey, along with geographic boundaries", f: {"dct_isPartOf_sm" => ["United States Census Data"]}},
          #{title: "Soviet Topographic Maps of the Arabian Peninsula", description: "Raster scans of Soviet military topographic maps produced in the late 1970s", f: { "dc_publisher_s" => ["Omni Resources (Firm)"]}}
          {title: "Latin American Census Geodatabases", description: "ESRI Geodatabases of census data from Latin American countries", f: {"dct_isPartOf_sm" => ["Latin American Census Data"]}},
          {title: "Vector Map 1 (VMap1) Layers", description: "Highly detailed vector layers depecting terrain, topology, transportation, and civil infrastructure", f: {"dct_isPartOf_sm" => ["VMap 1"]}},
      ]
    end

    def CuratedCollections.recent
      [
          {title: "2019 Sunset Park LiDAR", description: "High-density LiDAR datasets of Sunset Park, Brooklyn, from Debra Laefer (NYU) and collaborators", f: {"dct_isPartOf_sm" => ["2019 Sunset Park LiDAR"]}},
          {title: "2004 New York State Tax Parcels", description: "Point data on property ownership and land value", f: {"dct_isPartOf_sm" => ["NYS GIS Clearinghouse"]}},
          {title: "2011 India Census Data", description: "Vector village-level demographic data from the 2011 India Census", f: { "dc_publisher_s" => ["ML InfoMap (Firm)"]}}
      ]
    end

    def CuratedCollections.maps
      [
          {title: "2015 Aerial Laser and Photogrammetry Survey of Dublin", slug: "nyu-2451-38684"},
          {title: "2019 Aerial Lasar and Photogrammetry Survey of Sunset Park, Brooklyn", slug: "nyu-2451-60458"},
          {title: "China: Ch'ang-sha Region", slug: "harvard-ams7810-s250-u54-nh49-16"},
          {title: "1967 Communist China Agriculture", slug: "nyu-2451-36739"},
          {title: "2015 New York City Real Estate Sales", slug: "nyu-2451-34678"},
          {title: "1978 Soviet Map of Abu Dhabi", slug: "nyu-2451-34737"},
          {title: "2015 MapPLUTO Brooklyn V. 1", slug: "nyu-2451-34521"},
          {title: "100-Meter Resolution Land Cover of the Conterminous United States", slug: "stanford-wv372bn9329"},
          {title: "2016 LION Single Line Map for New York City", slug: "nyu-2451-34565"}
      ]
    end

  end
end
