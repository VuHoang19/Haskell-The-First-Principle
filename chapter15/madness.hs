import Data.Monoid

type Verb = String 
type Adjective = String 
type Adverd = String 
type Noun = String 
type Exclamation = String 

madlibbin' :: Exclamation
           -> Adverd 
           -> Noun
           -> Adjective
           -> String 
madlibbin' e adv noun adj = 
    e   <> "! he said " <>
    adv <> " as he jumped into his car " <>
    noun <> " and drove off his " <>
    adj <> " wife."

madlibbinBetter' :: Exclamation
              -> Adverb
              -> Noun 
              -> Adjective 
              -> String 

madlibbinBetter' e adv noun adj = 
    mconcat [e, "! he said ", adv, " as he jumped into his car "
            , noun, " and drove off with his ", 
            , adj, " wife."]
