# Write your MySQL query statement below
SELECT
    question_id as survey_log
FROM
(
    SELECT
        question_id,
        sum(case when answer_id is not null then 1 else 0 end) as answer_rate,
        sum(case when answer_id is null and action = 'show' then 1 else 0 end) as show_rate
    FROM
        SurveyLog
    group by
        question_id
) s
order by
    answer_rate/show_rate desc, question_id asc
limit 1
