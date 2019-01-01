module MGSyntax where
import Prelude hiding (head)

import Data.Set (Set)
import qualified Data.Set as Set

type Alph = String

type Sel = String

type Lic = String

data Feat = Pos Lic | Neg Lic | Cat Sel | Eql Sel deriving (Show)

--Sel Eql |  
 --              +f          -f       x       =x      x=

type Expr = Tree

data Tree = Complex (Arrow, Tree, Tree) | Lex (Alph, [Feat]) deriving (Show)

type Arrow = String


--examples of expressions
expr1 = Lex ("ointment", [Cat "d"])
expr2 = Complex ("<", (Lex ("saw", [Eql "d", Cat "V"])), (Lex ("everyone", [Cat "d", Neg "k"])))


    --Functions--

    --head of an expression--
head :: Expr -> Expr
head (Lex (alph, feat)) = (Lex (alph, feat))
head (Complex (arr, left, right)) = if arr == "<" then head left else head right

    --merge function for derived trees--
--merge :: Expr -> Expr -> Maybe Expr
--merge (Lex (alphl, featl)) (Lex (alphr, featr)) = if (check featl featr)

--merge (Lex (alph, feat)) (Complex (arr, left, right)) = undefined
--merge (Complex (arr, left, right)) (Lex (alph, feat)) = undefined
--merge (Complex (arr, left, right)) (Complex (arr, left, right)) = undefined

    --get head of merging pair--
headof :: [Feat] -> [Feat] -> Maybe [Feat]
headof [] x = Nothing
headof x [] = Nothing
headof ((Cat fl):fls) ((Eql fr):frs) = if (fl == fr) 
    then Just ((Eql fr):frs) 
    else Nothing
headof ((Eql fl):fls) ((Cat fr):frs) = if (fl == fr)
    then Just ((Eql fl):fls)
    else Nothing


    --check whether features match--
check :: [Feat] -> [Feat] -> Bool
check [] x = False
check x [] = False
check ((Cat fl):fls) ((Eql fr):frs) = if (fl == fr) then True else False     
check ((Eql fl):fls) ((Cat fr):frs) = if (fl == fr) then True else False     
check _ _ = False
