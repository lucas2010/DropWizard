package pt.lucas2010.api;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.hibernate.validator.constraints.Length;

public class Saying {
    private long id;

    @Length(max = 3)
    private String content;

    private String stackDump;

    private String fileContent;

    private String cassandraRecord;

    public Saying() {
        // Jackson deserialization
    }

    public Saying(long id, String content, String stackDump, String fileContent, String cassandraRecord) {
        this.id = id;
        this.content = content;
        this.stackDump = stackDump;
        this.fileContent = fileContent;
        this.cassandraRecord = cassandraRecord;
    }

    public Saying(long id, String content) {
        this.id = id;
        this.content = content;
    }

    @JsonProperty
    public long getId() {
        return id;
    }

    @JsonProperty
    public String getContent() {
        return content;
    }

    @JsonProperty
    public String getStackDump() {
        return stackDump;
    }

    @JsonProperty
    public String getFileContent() {
        return fileContent;
    }

    @JsonProperty
    public String getCassandraRecord() {
        return cassandraRecord;
    }


    public void setFileContent(String fileContent){ this.fileContent = fileContent; }

    public void setStackDump(String stackDump){ this.stackDump = stackDump; }

    public void setCassandraRecord(String cassandraRecord){ this.cassandraRecord = cassandraRecord; }
}
