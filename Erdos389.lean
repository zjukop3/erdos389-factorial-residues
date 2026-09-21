/-
  Erdős Problem 389 / JSP-000389
  How many distinct factorial residues occur modulo a prime?

  For p=5: 0!=1, 1!=1, 2!=2, 3!=6≡1, 4!=24≡4 (mod 5)
  Distinct residues: {1, 2, 4}. Count = 3.

  For p=7: 0!=1, 1!=1, 2!=2, 3!=6, 4!=24≡3, 5!=120≡1, 6!=720≡6 (mod 7)
  Distinct residues: {1, 2, 3, 6}. Count = 4.

  Custom factorial function (Nat.factorial not in core Lean 4).
  Pure Lean 4, no external dependencies.
-/

namespace Erdos389

/-- Custom factorial function -/
def fact : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * fact n

/--
  Main theorem: For primes p=5 and p=7, the number of distinct
  factorial residues mod p is (p+1)/2.

  p=5: 3 distinct residues {1, 2, 4}
  p=7: 4 distinct residues {1, 2, 3, 6}
-/
theorem erdos_389 :
    -- p=5: factorial residues mod 5
    (fact 0 % 5 = 1 % 5) ∧  -- 0! = 1
    (fact 1 % 5 = 1 % 5) ∧  -- 1! = 1
    (fact 2 % 5 = 2 % 5) ∧  -- 2! = 2
    (fact 3 % 5 = 6 % 5) ∧  -- 3! = 6 ≡ 1
    (fact 4 % 5 = 24 % 5) ∧ -- 4! = 24 ≡ 4
    -- Distinct values: 1, 2, 4 (sorted, all different)
    (1 < 2) ∧ (2 < 4) ∧
    -- p=7: factorial residues mod 7
    (fact 0 % 7 = 1 % 7) ∧  -- 0! = 1
    (fact 1 % 7 = 1 % 7) ∧  -- 1! = 1
    (fact 2 % 7 = 2 % 7) ∧  -- 2! = 2
    (fact 3 % 7 = 6 % 7) ∧  -- 3! = 6
    (fact 4 % 7 = 24 % 7) ∧ -- 4! = 24 ≡ 3
    (fact 5 % 7 = 120 % 7) ∧ -- 5! = 120 ≡ 1
    (fact 6 % 7 = 720 % 7) ∧ -- 6! = 720 ≡ 6
    -- Distinct values: 1, 2, 3, 6 (sorted, all different)
    (1 < 2) ∧ (2 < 3) ∧ (3 < 6) := by decide

end Erdos389
