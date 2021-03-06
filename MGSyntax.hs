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

<<<<<<< HEAD
--merge function for derived trees
{-merge :: Expr -> Expr -> Expr
merge (Lex (alph, featl)) (Lex (alph, featr)) = undefined


merge (Lex (alph, feat)) (Complex (arr, left, right)) = undefined
merge (Complex (arr, left, right)) (Lex (alph, feat)) = undefined
merge (Complex (arr, left, right)) (Complex (arr, left, right)) = undefined
-}

{--
--check whether features match--
check :: [Feat] -> [Feat] -> Bool
check [] x = False
check x [] = False
check (fl:fls) (fr:frs) = if 
    fl == (Cat String) && fr == (Eql String) ||
    fl == (Eql String) && fr == (Cat String) then True else False

    --}

--testing check function
feat1 = [Eql "d", Cat "V"]
feat2 = [Cat "d", Neg "k"]
feat3 = [Cat "v", Cat "V"]




    
=======
--merge function for derived trees--
merge :: Expr -> Expr -> Maybe Expr
merge (Lex (alphl, featl)) (Lex (alphr, featr)) = 
	if (checkmerge featl featr)
		then if（headof featl featr == featl）
			 then Just (left, (alph1, cutoff featl), (alphr, cutoff featr) )
			 else Just (right, (alphr, cutoff featr), (alph1, cutoff featl) )
	else Nothing

merge (Lex (alph, feat)) (Complex (arr, left, right)) = 
	if (checkmerge feat extractfeature (Complex (arr, left, right)))
		then if（headof feat extractfeature (Complex (arr, left, right)) == feat）
			 then Just (left, (alph, cutoff feat), newtree (Complex (arr, left, right)) )
			 else Just (right, newtree (Complex (arr, left, right)), (alph, cutoff feat )
	else Nothing

merge (Complex (arr, left, right)) (Lex (alph, feat)) = 
    if (checkmerge extractfeature (Complex (arr, left, right)) feat)
		then if （headof feat extractfeature (Complex (arr, left, right)) == feat）
			 then Just (left, (alph, cutoff feat), newtree (Complex (arr, left, right)) )
			 else Just (right, newtree (Complex (arr, left, right)), (alph, cutoff feat) )
	else Nothing


merge (Complex (arrl, left1, right1)) (Complex (arrr, left2, right2)) = 
    if (checkmerge extractfeature (Complex (arr, left, right)) extractfeature (Complex (arrr, left2, right2)))
	    then if (headof extractfeature (Complex (arr, left, right)) extractfeature (Complex (arrr, left2, right2)) == extractfeature (Complex (arr, left, right)))
	         then Just (left, newtree (Complex (arrl, left1, right1)), newtree (Complex (arrr, left2, right2)))
		     else Just (right, newtree (Complex (arrr, left2, right2)), newtree (Complex (arrr, left1, right1)))
    else Nothing

--helper functions of MOVE function--
--get the feature of the head of merging pair--
headof :: [Feat] -> [Feat] -> Maybe [Feat]
headof [] x = Nothing
headof x [] = Nothing
headof ((Cat fl):fls) ((Eql fr):frs) = if (fl == fr) 
    then Just ((Eql fr):frs) -- Just frs
    else Nothing
headof ((Eql fl):fls) ((Cat fr):frs) = if (fl == fr)
    then Just ((Eql fl):fls) --- Just fls
    else Nothing

--get the rest of the unchecked features with the assumption that you only check the first feature of each tree's features--
cutoff :: [Feat] -> [Feat]
cutoff [] = []
cutoff x:xs = xs

--get the features of a tree with the assumption that the feature of a tree is the concatenation of the features of its subtrees--
extractfeature :: Expr -> [Feat]
extractfeature Lex (Alph, [Feat]) = [Feat]
extractfeature Complex (Arrow, Tree1, Tree2) = (extractfeature Tree1) + (extractfeature Tree2)

--when merging trees, we need to delete the feature of a leaf in the tree--
newtree  :: Expr -> Expr
newtree (Lex (alph, feat)) = (Lex (alph, cutoff feat))
newtree (Complex (Arrow, Tree1, Tree2)) =   (Arrow, newtree Tree1, Tree2)

--check whether features match--
checkmerge :: [Feat] -> [Feat] -> Bool
checkmerge [] x = False
checkmerge x [] = False
checkmerge ((Cat fl):fls) ((Eql fr):frs) = if (fl == fr) then True else False     
checkmerge ((Eql fl):fls) ((Cat fr):frs) = if (fl == fr) then True else False     
checkmerge _ _ = False

{--
--renew the features of a tree--
--repfeat :: Expr -> [Feat] -> Expr
--repfeat (Lex (alph, feat)) x = (Lex (alph, x))
--repfeat (Complex (Arrow, Treel, Treer)) x = 
	--if extractfeature Treel != []
		--then (Complex (Arrow, repfeat (Treel, x), Treer)
	--else (Complex (Arrow, Treel, repfeat (Treer, x))

--get the tree right after merge--
 --newtree :: Expr -> Expr
 --newtree (Lex (alph, feat)) = (Lex (alph, cutoff feat))
 --newtree (Complex (Arrow, Treel, Treer)) = 
 	--if extractfeature Tree1 != []
 		--then (Complex (Arrow, repfeat(Treel, cutoff extractfeature Treel), Treer))
 	--else
 		--(Complex (Arrow, Treel, repfeat(Treer, cutoff extractfeature Treer))

-}


=======
--move function for derived trees--
{--

--the function takes the whole tree and the licensor, outputs a moved tree--
move ::Expr -> Expr
move (Lex (alph, feat)) = (Lex (alph, feat))
move (Complex (Arrow, Treel, Treer)) = 
let featseq = extractfeature Treel + extractfeature Treer in
if ((searchmover featseq Complex (Arrow, Treel, Treer)))) != Nothing)
	then let mover = searchmover featseq (Complex (Arrow, Treel, Treer)) in
	(right, newtree mover, lefttree mover (Complex (Arrow, Treel, Treer)))
else (Arrow, move Treel, move Treer)

--helper functions of move function--

--the function looks for the subtree that matches the feature of the licensor in some range--
--it takes a feature and a tree, returns the mover--
searchmover::[Feat] -> Expr -> Maybe Expr
searchmover [] (Lex (alph, feat)) = Nothing
searchmover x:xs (Lex (alph, feat)) = Nothing
searchmover [] (Complex (Arrow, Treel, Treer)) = Nothing
searchmover x:xs (Complex (Arrow, Treel, Treer)) = 
	--a binary search here--






--the function checks where a tree belongs to--
lefttree::Expr -> Expr -> Expr










--}
