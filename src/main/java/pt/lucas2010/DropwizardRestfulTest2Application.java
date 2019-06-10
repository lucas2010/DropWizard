package pt.lucas2010;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import pt.lucas2010.health.TemplateHealthCheck;
import pt.lucas2010.resources.HelloWorldResource;

public class DropwizardRestfulTest2Application extends Application<DropwizardRestfulTest2Configuration> {

    public static void main(final String[] args) throws Exception {
        new DropwizardRestfulTest2Application().run(args);
    }

    @Override
    public String getName() {
        return "dropwizardRestfulTest2";
    }

    @Override
    public void initialize(final Bootstrap<DropwizardRestfulTest2Configuration> bootstrap) {
        // TODO: application initialization
    }

    @Override
    public void run(final DropwizardRestfulTest2Configuration configuration,
                    final Environment environment) {
        final HelloWorldResource resource = new HelloWorldResource(
                configuration.getTemplate(),
                configuration.getDefaultName()
        );

        final TemplateHealthCheck healthCheck =
                new TemplateHealthCheck(configuration.getTemplate());
        environment.healthChecks().register("template", healthCheck);

        environment.jersey().register(resource);
    }

}
