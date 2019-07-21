package pt.lucas2010.db;

import org.glassfish.jersey.spi.Contract;

@Contract
public interface ICassandraDAL {
    String getObject(String rpid);
}
