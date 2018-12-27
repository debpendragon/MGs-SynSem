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