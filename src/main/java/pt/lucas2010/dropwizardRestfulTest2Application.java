package pt.lucas2010;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class dropwizardRestfulTest2Application extends Application<dropwizardRestfulTest2Configuration> {

    public static void main(final String[] args) throws Exception {
        new dropwizardRestfulTest2Application().run(args);
    }

    @Override
    public String getName() {
        return "dropwizardRestfulTest2";
    }

    @Override
    public void initialize(final Bootstrap<dropwizardRestfulTest2Configuration> bootstrap) {
        // TODO: application initialization
    }

    @Override
    public void run(final dropwizardRestfulTest2Configuration configuration,
                    final Environment environment) {
        // TODO: implement application
    }

}
