ALTER TABLE _ SET (parallel_workers = 80);
SET max_parallel_maintenance_workers to 4;
SET maintenance_work_mem to '4 GB';

CREATE INDEX normalized_0 ON tweet_tags(tag, id_tweets);
CREATE INDEX normalized_1 ON tweet_tags(id_tweets, tag);
CREATE INDEX normalized_2 ON tweets USING GIN(to_tsvector('english', text)) WHERE lang = 'en';
CREATE INDEX normalized_3 ON tweets(id_tweets, lang);
CREATE INDEX normalized_4 ON tweets(lang);
CREATE INDEX normalized_5 ON tweet_tags(tag text_pattern_ops, id_tweets);
