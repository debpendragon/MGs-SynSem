import Data.Set (Set)
import qualified Data.Set as Set

module MGSyntax where
	
	data Alph = String

    data Sel = String

    data Lic = String

    data Feat = Pos Lic | Neg Lic | Cat Sel | Eql Sel | Sel Eql 
    --              +f          -f       x          =x          x=

    data Expr = Tree

    data Tree = Arrow Tree Tree | Lex

    data Arrow =  "<" | ">"

    data Lex = (Alph, [Feat])

    head :: Expr -> Expr
    head (alph,feat) = (alph,feat)
    head (arr, left, right) = if arr = "<" then head left else head right
 

