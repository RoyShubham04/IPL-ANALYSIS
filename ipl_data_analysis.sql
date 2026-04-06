use ipl_analysis;
select * from ipl limit 10

-- 1. Which team has won the most matches?
SELECT match_winner, COUNT(*) AS total_wins
FROM ipl
GROUP BY match_winner
ORDER BY total_wins DESC;

-- 2. Does winning the toss help win the match?
SELECT COUNT(*) AS total_matches,
    SUM(CASE WHEN toss_winner = match_winner THEN 1 ELSE 0 END) AS toss_win_match_win
FROM ipl;

-- 3. How many matches are won by chasing vs defending?
SELECT 
    CASE 
        WHEN second_ings_score > first_ings_score THEN 'Chasing'
        ELSE 'Defending'
    END AS win_type,
    COUNT(*) AS matches
FROM ipl
GROUP BY win_type;

-- 4. Which venue has highest average score?
SELECT venue_x, AVG(first_ings_score) AS avg_score
FROM ipl
GROUP BY venue_x
ORDER BY avg_score DESC limit 5;

-- 5. Top 10 highest scoring matches
SELECT match_id, first_ings_score, second_ings_score,
       (first_ings_score + second_ings_score) AS total_match_runs
FROM ipl
ORDER BY total_match_runs DESC
LIMIT 10;

-- 6. Player of the Match leaders
SELECT player_of_the_match, COUNT(*) AS awards
FROM ipl
GROUP BY player_of_the_match
ORDER BY awards DESC
LIMIT 10;

-- 7. Best bowlers (most times best bowling) 
SELECT best_bowling, COUNT(*) AS times_best
FROM ipl
GROUP BY best_bowling
ORDER BY times_best DESC
LIMIT 10;

-- 8. Toss decision distribution
SELECT toss_decision, COUNT(*) AS count
FROM ipl
GROUP BY toss_decision;

-- 9. Average margin of victory (runs)
SELECT AVG(first_ings_score - second_ings_score) AS avg_run_margin
FROM ipl
WHERE first_ings_score > second_ings_score; 

-- 10. Which team performs best at each venue?
SELECT venue_x, match_winner, COUNT(*) AS wins
FROM ipl
GROUP BY venue_x, match_winner
ORDER BY venue_x, wins DESC;