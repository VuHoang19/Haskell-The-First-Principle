import Data.Time 

data DatabaseItem = DbString String 
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [ DbDate (UTCTime
                (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]

filterDbDate :: [DatabaseItem]
             -> [UTCTime]
filterDbDate = foldr concatenates []
    where concatenates (DbDate t) ts = t: ts 
          concatenates _          ts = ts 

filterDbNumber :: [DatabaseItem]
               -> [Integer]
filterDbNumber = foldr concatenates []
    where concatenates (DbNumber n) ns = n: ns 
          concatenates _            ns = ns 

mostRecent :: [DatabaseItem]
           -> UTCTime
mostRecent = foldr maxDate (UTCTime (ModifiedJulianDay 0) 0)
    where maxDate (DbDate t) mt = max t mt 
          maxDate _          mt = mt 

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr sumNumbers 0
    where sumNumbers (DdNumber n) sn = n + sn 
          sumNumbers _            sn = sn

avgDb :: [DatabaseItem] -> Double
avgDb db = fromIntegral (sumDb db) (sumDb db) / fromIntegral (length $ filterDbNumber db)
