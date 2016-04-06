require 'pry'

class Prime
  @@primes = [2, 3]

  def self.nth(n)
    raise ArgumentError if n < 1
    return n + 1 if n <= 2

    @@primes << next_prime until @@primes.size == n
    @@primes.last
  end

  private

  def self.next_prime
    number = @@primes.last + 2
    number += 2 until prime? number
    number
  end

  def self.prime? number
    for prime in @@primes
      return false if number % prime == 0
      return true if prime**2 > number
    end
  end
end