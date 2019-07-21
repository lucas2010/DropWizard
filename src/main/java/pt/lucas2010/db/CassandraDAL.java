package pt.lucas2010.db;

import com.datastax.oss.driver.api.core.CqlSession;
import com.datastax.oss.driver.api.core.cql.ResultSet;
import com.datastax.oss.driver.api.core.cql.Row;
import org.jvnet.hk2.annotations.Service;

import javax.inject.Singleton;

@Service @Singleton
public class CassandraDAL implements AutoCloseable, ICassandraDAL {
    private CqlSession session;

    public CassandraDAL(){
        this.session = CqlSession.builder().build();
    }

    public String getObject(String rpid){
        // We use execute to send a query to Cassandra. This returns a ResultSet, which
        // is essentially a collection of Row objects.
        ResultSet rs = this.session.execute("select * from lc_object_trace.lc_object");
        //  Extract the first row (which is the only one in this case).
        Row row = rs.one();

        if(row == null)
            return "'select * from lc_object_trace.lc_object' did not return any results!";


        return row.getString(0);
    }

    public void close(){
        assert session !=null : "Cassandra driver session object is null!";
        session.close();
    }

}
