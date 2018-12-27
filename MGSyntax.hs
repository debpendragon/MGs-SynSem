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

--merge function for derived trees
merge :: Expr -> Expr -> Expr
merge (Lex (alph, featl)) (Lex (alph, featr)) = undefined 


merge (Lex (alph, feat)) (Complex (arr, left, right)) = undefined
merge (Complex (arr, left, right)) (Lex (alph, feat)) = undefined
merge (Complex (arr, left, right)) (Complex (arr, left, right)) = undefined

--check whether features match
check :: [Feat] -> [Feat] -> Bool
check [] x = False
check x [] = False
check (fl:fls) (fr:frs) = if 
    fl == (Cat f) && fr == (Sel f) ||
    fl == (Sel f) && fr == (Cat f) then True else False
    
