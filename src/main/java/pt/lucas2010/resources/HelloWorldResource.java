package pt.lucas2010.resources;

import com.codahale.metrics.annotation.Timed;
import pt.lucas2010.api.Saying;
import pt.lucas2010.db.CassandraDAL;
import pt.lucas2010.db.ICassandraDAL;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

@Path("/hello-world")
@Produces(MediaType.APPLICATION_JSON)
public class HelloWorldResource {
    private final String template;
    private final String defaultName;
    private final AtomicLong counter;
//    @Inject
    private ICassandraDAL cassandraDAL;


    public HelloWorldResource(String template, String defaultName, ICassandraDAL cassandraDAL) {
        this.template = template;
        this.defaultName = defaultName;
        this.counter = new AtomicLong();
        this.cassandraDAL = cassandraDAL;

    }

    @GET
    @Timed
    public Saying sayHello(@QueryParam("name") Optional<String> name) {
        final String value = String.format(template, name.orElse(defaultName));
        Saying say = new Saying(counter.incrementAndGet(), value);

        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("./volume/test.txt", true));
            writer.newLine();
            writer.write(Long.toString(say.getId()));
            writer.write("-");
            writer.write(say.getContent());
            writer.flush();
            writer.close();

            try(BufferedReader reader = new BufferedReader(new FileReader("./volume/test.txt"))) {
                say.setFileContent(reader.lines().collect(Collectors.joining(System.lineSeparator())));
            }

        }
        catch (Throwable th) {
            say.setStackDump(th.getStackTrace().toString());
            th.printStackTrace();
        }

        String cassandraRecord = this.cassandraDAL.getObject("adfsdertg");

        say.setCassandraRecord(cassandraRecord);

        return say;
    }


    public void setCassandraDAL(CassandraDAL cassandraDAL) {
        this.cassandraDAL = cassandraDAL;
    }
}
