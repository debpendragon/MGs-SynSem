import Data.Set (Set)
import qualified Data.Set as Set

module MGSyntax where
	
	data Alphabet = String

	data Features = [Lic Features | Sel Features | Lic | Sel]

	--data Lic = Set.fromlist ["+wh", "-wh"]

	--data Sel = Set.fromlist ["=d", "=v", "d", "v"]

    data Lic = Plus String | Minus String

    data Plus = "+"
    data Minus = "-"    

    data Sel = Equal String | String Equal | String

    data Equal = "="

	data Lex = (Alphabet, Features) -- and Meaning :O

	--Ops = [(Merge), (Move)]

	---
	--- define Expression: 
	---

	data Expression = Tree

	data Tree = (Arrow, Tree, Tree) | (Alphabet, Features)

	data Arrow  = "<" | ">"


	--
	-- define head:
	--

	head :: Expression -> Expression
	head (alph,feat) = (alph,feat)
	head (arr, left, right) = if arr = "<" then head left else head right

	merge :: Expression -> Expression -> Expression
	merge (alph1,h1:feat1) (alph2,h2:feat2) = if 
