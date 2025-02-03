import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Solutions',
    Svg: require('@site/static/img/proval.svg').default,
    description: (
      <>
        <a href='docs/solutions'>Documentation</a><br />
        <span>Solutions are collections of scripts and tools that are designed to solve a specific problem or set of problems.</span>
      </>
    ),
  },
  {
    title: 'PowerShell',
    Svg: require('@site/static/img/PowerShell.svg').default,
    description: (
      <>
        <a href='docs/powershell'>Documentation</a><br />
        <span>PowerShell is a task automation and configuration management framework from Microsoft, consisting of a command-line shell and associated scripting language.</span>
      </>
    ),
  },
  {
    title: 'ConnectWise Automate',
    Svg: require('@site/static/img/cwa.svg').default,
    description: (
      <>
        <a href='docs/cwa'>Documentation</a><br />
        <span>ConnectWise Automate is a remote monitoring and management (RMM) platform that provides a suite of tools to help IT service providers manage their clients' endpoints.</span>
      </>
    ),
  },
  {
    title: 'ConnectWise RMM',
    Svg: require('@site/static/img/connectwise_logo_e.svg').default,
    description: (
      <>
        <a href='docs/cwrmm'>Documentation</a><br />
        <span>ConnectWise RMM is a remote monitoring and management (RMM) platform that provides a suite of tools to help IT service providers manage their clients' endpoints.</span>
      </>
    ),
  },
  {
    title: 'Datto RMM',
    Svg: require('@site/static/img/datto.svg').default,
    description: (
      <>
        <a href='docs/dattormm'>Documentation</a><br />
        <span>Datto RMM is a remote monitoring and management (RMM) platform that provides a suite of tools to help IT service providers manage their clients' endpoints.</span>
      </>
    ),
  },
  {
    title: 'Kaseya VSA',
    Svg: require('@site/static/img/kaseya.svg').default,
    description: (
      <>
        <a href='docs/vsa'>Documentation</a><br />
        <span>Kaseya VSA is a remote monitoring and management (RMM) platform that provides a suite of tools to help IT service providers manage their clients' endpoints.</span>
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
