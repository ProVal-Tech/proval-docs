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
      </>
    ),
  },
  {
    title: 'PowerShell',
    Svg: require('@site/static/img/PowerShell.svg').default,
    description: (
      <>
        <a href='docs/powershell'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'ConnectWise Automate',
    Svg: require('@site/static/img/cwa.svg').default,
    description: (
      <>
        <a href='docs/cwa'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'ConnectWise RMM',
    Svg: require('@site/static/img/connectwise_logo_e.svg').default,
    description: (
      <>
        <a href='docs/cwrmm'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'Datto RMM',
    Svg: require('@site/static/img/datto.svg').default,
    description: (
      <>
        <a href='docs/dattormm'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'Kaseya VSA',
    Svg: require('@site/static/img/kaseya.svg').default,
    description: (
      <>
        <a href='docs/vsa'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'VSA X',
    Svg: require('@site/static/img/vsax.svg').default,
    description: (
      <>
        <a href='docs/vsax'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'Apps',
    Svg: require('@site/static/img/apps.svg').default,
    description: (
      <>
        <a href='docs/apps'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'NinjaOne',
    Svg: require('@site/static/img/ninjaone.svg').default,
    description: (
      <>
        <a href='docs/ninjaone'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'ImmyBot',
    Svg: require('@site/static/img/immybot.svg').default,
    description: (
      <>
        <a href='docs/immybot'>Documentation</a><br />
      </>
    ),
  },
  {
    title: 'Rewst',
    Svg: require('@site/static/img/rewst.svg').default,
    description: (
      <>
        <a href='docs/rewst'>Documentation</a><br />
      </>
    ),
  },
];

function Feature({ title, Svg, description }: FeatureItem) {
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
