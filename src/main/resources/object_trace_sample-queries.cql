USE lc_object_trace;

//Object select statements
// Select all objects. Will be limited to 1000 rows. Rows returned in a random order.
SELECT * 
FROM lc_object;

// Select on a specific object. Result set will contain first and last name
SELECT trace_number, created_at 
FROM lc_object
WHERE trace_number = 'RP1254879PT';

// Select on a map collection. Only the entire list can be returned. 
SELECT eventid, event_metadata
FROM lc_object_event
WHERE obj_trace_number = 'RP1254879PT';







//garbage

// Video select statements. 

// Select everything from a specific video based on ID. Note the format for UUID and it is not quoted.
SELECT * 
FROM videos
WHERE videoid = 06049cbb-dfed-421f-b889-5f649a0de1ed;

// Select set collection. Only the entire set can be returned.
SELECT tags
FROM videos
WHERE videoid = 06049cbb-dfed-421f-b889-5f649a0de1ed;

// Username->video index. With more fields in the PRIMARY KEY declaration,
// we can do a variety of interesting queries. 
// Lookup video by username
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin';

// Lookup video but ORDER BY the upload date
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
ORDER BY upload_date;

// Lookup video and reverse sort upload date but ORDER BY
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
ORDER BY upload_date DESC;

// Lookup last video uploaded by reverse sorting upload date and limiting results;
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
ORDER BY upload_date DESC
LIMIT 1;

// Lookup video by username and upload date greater than June 6, 2013
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
AND upload_date > '2013-06-01';

// Lookup video by username and upload date between May 15, 2013 and July 1, 2013
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
AND upload_date > '2013-05-15'
AND upload_date < '2013-07-01';

// Lookup video by username and upload date between May 15, 2013 and July 1, 2013 and order results
SELECT videoname,videoid,upload_date
FROM username_video_index
WHERE username = 'pmcfadin'
AND upload_date > '2013-05-15'
AND upload_date < '2013-07-01'
ORDER BY upload_date;

// Video rating selects
// Select counter fields. Divide rating_total by rating_counter to get average rating.
SELECT rating_counter, rating_total
FROM video_rating
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0;

// Tag index
// Find a list of videos by tag
SELECT videoid, tag_ts
FROM tag_index
WHERE tag = 'lol';


// Video comments. We have stored this many-to-many in two different fields.
// We will query on either table based on which view we want.
// From the side of comments by video
// All comments for a video
SELECT username, comment, dateOf(comment_ts)
FROM comments_by_video
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0;

// Last comment made on a video
SELECT username, comment, dateOf(comment_ts)
FROM comments_by_video
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0
LIMIT 1;

// From the side of comments by username
// Specific comments for a video by one user
SELECT username, comment, dateOf(comment_ts)
FROM comments_by_user
WHERE username = 'cdate';

// Video event. Time series
// Select all events for a particular video and user combination
//
// Note: This query is flagged as invalid in the editor.
// The error message should hint how to fix it.
SELECT dateOf(event_timestamp), event, video_timestamp
FROM video_event
WHERE videoid = 99051fe9-6a9c-46c2-b949-38ef78858dd0
AND username= 'tcodd'
AND event = 'stop';
